---
layout: default
title: AI Agents
parent: AI & Machine Learning
nav_order: 10
---

# AI Agents

AI agents are autonomous systems that use LLMs as reasoning engines, combined with tools, memory, and planning capabilities to accomplish complex tasks.

## Introduction

AI agents go beyond simple chat interfaces by taking actions, using external tools, and making decisions based on observations. They can break down complex tasks, use various tools, and learn from feedback.

### Agent Architecture Components

| Component | Purpose | Examples |
|-----------|---------|----------|
| LLM Brain | Reasoning, planning | GPT-4, Claude |
| Tools | Actions, data access | APIs, code execution |
| Memory | Context persistence | Vector DB, files |
| Planning | Task decomposition | ReAct, CoT |

## Key Concepts

### 1. ReAct Agent Pattern

```python
# ReAct: Reason + Act loop
from langchain.agents import AgentExecutor, create_react_agent
from langchain.tools import Tool
from langchain.chat_models import ChatOpenAI

# Define tools
def search(query):
    """Search the web for information"""
    # Implementation here
    return f"Search results for: {query}"

def calculator(expression):
    """Evaluate mathematical expressions"""
    return str(eval(expression))

tools = [
    Tool(name="Search", func=search, description="Search for information"),
    Tool(name="Calculator", func=calculator, description="Calculate math expressions")
]

# Create agent
llm = ChatOpenAI(model="gpt-4", temperature=0)
agent = create_react_agent(llm, tools, prompt_template)
agent_executor = AgentExecutor(agent=agent, tools=tools, verbose=True)

# Run agent
result = agent_executor.invoke({"input": "What is the population of France divided by 3?"})
```

### 2. Tool Integration

```python
# Custom tool definition
from langchain.tools import BaseTool
from pydantic import BaseModel, Field

class SearchInput(BaseModel):
    query: str = Field(description="Search query")

class WebSearchTool(BaseTool):
    name = "web_search"
    description = "Search the web for current information"
    args_schema = SearchInput
    
    def _run(self, query: str) -> str:
        # Implement web search
        import requests
        response = requests.get(f"https://api.search.com?q={query}")
        return response.json()["results"]
    
    async def _arun(self, query: str) -> str:
        # Async version
        return self._run(query)

# Add to agent
tools = [WebSearchTool()]
```

### 3. Memory Systems

```python
# Agent with memory
from langchain.memory import ConversationBufferWindowMemory
from langchain.agents import initialize_agent

# Short-term memory
memory = ConversationBufferWindowMemory(
    memory_key="chat_history",
    return_messages=True,
    k=10  # Keep last 10 exchanges
)

# Long-term memory (vector store)
from langchain.vectorstores import FAISS

class LongTermMemory:
    def __init__(self, vectorstore):
        self.vectorstore = vectorstore
    
    def save(self, content, metadata):
        self.vectorstore.add_texts([content], [metadata])
    
    def recall(self, query, k=5):
        return self.vectorstore.similarity_search(query, k=k)
```

## FAQ

### Q1: When should I use an agent vs a simple chain?

**Answer:** Use agents when:
- Task requires multiple steps
- Need to use external tools
- Dynamic decision-making required
- Task is complex and unpredictable

Use chains when:
- Simple, predictable flow
- Single LLM call suffices
- Performance is critical

### Q2: How do I prevent agents from going into infinite loops?

**Answer:** Techniques:
- Set max iterations (e.g., `max_iterations=10`)
- Implement timeout mechanisms
- Track repeated actions
- Use early stopping criteria

```python
agent_executor = AgentExecutor(
    agent=agent,
    tools=tools,
    max_iterations=10,
    early_stopping_method="generate"
)
```

### Q3: What is the best agent framework?

**Answer:** Popular options:
- **LangChain**: Most features, large community
- **LlamaIndex**: Best for RAG-focused agents
- **AutoGen**: Multi-agent conversations
- **CrewAI**: Role-based multi-agent

### Q4: How do agents handle errors?

**Answer:** Error handling strategies:
1. Catch tool errors and retry
2. Use fallback tools
3. Implement graceful degradation
4. Log errors for debugging
5. Ask for human intervention when needed

```python
try:
    result = tool.run(input)
except ToolError as e:
    # Log and try alternative
    logger.error(f"Tool error: {e}")
    result = alternative_tool.run(input)
```

### Q5: How do I test AI agents?

**Answer:** Testing approaches:
- Unit test individual tools
- Mock LLM responses for deterministic tests
- Integration tests with recorded responses
- Human evaluation for quality
- A/B testing different agent configurations

### Q6: What is multi-agent collaboration?

**Answer:** Multiple agents working together:
- **Supervisor**: Coordinates other agents
- **Specialist**: Each handles specific tasks
- **Debate**: Agents discuss before answering
- **Sequential**: Agents pass work in pipeline

### Q7: How do I manage agent state?

**Answer:** State management options:
- In-memory for single sessions
- Redis for distributed systems
- Database for persistence
- File system for simple cases

### Q8: What are the security concerns with agents?

**Answer:** Security considerations:
- Tool access control
- Input sanitization
- Output validation
- Rate limiting
- Sandbox execution for code
- Audit logging

### Q9: How do agents handle ambiguous instructions?

**Answer:** Strategies:
- Ask clarifying questions
- Make reasonable assumptions
- Use confirmation before actions
- Implement human-in-the-loop

### Q10: What is the future of AI agents?

**Answer:** Trends:
- Better planning capabilities
- Improved tool use
- Multi-modal agents
- Autonomous coding agents
- Enterprise agent frameworks

## Common Mistakes

### 1. Not Setting Proper Limits

```python
# ❌ Wrong: No iteration limits
agent_executor = AgentExecutor(agent=agent, tools=tools)

# ✅ Right: Set appropriate limits
agent_executor = AgentExecutor(
    agent=agent,
    tools=tools,
    max_iterations=5,
    max_execution_time=30,  # seconds
    handle_parsing_errors=True
)
```

### 2. Poor Tool Descriptions

```python
# ❌ Wrong: Vague tool description
def search(query):
    """Searches things"""
    pass

# ✅ Right: Clear, detailed description
def search(query):
    """Search the web for current information.
    
    Use this when you need to find up-to-date facts,
    news, or information not in your training data.
    
    Args:
        query: The search query string
        
    Returns:
        Dictionary with 'results' key containing list of dicts
        with 'title', 'url', and 'snippet' keys
    """
    pass
```

### 3. Ignoring Failure Modes

```python
# ❌ Wrong: No error handling
result = agent.run("Do something complex")

# ✅ Right: Handle various failures
try:
    result = agent_executor.invoke({"input": "complex task"})
except MaximumIterationsExceeded:
    result = "Task required too many steps. Here's what I found so far: ..."
except ToolException as e:
    result = f"Error using tool: {e}. Let me try a different approach."
```

## Best Practices

### 1. Agent Design Pattern

```python
# Well-structured agent
class ResearchAgent:
    def __init__(self):
        self.llm = ChatOpenAI(model="gpt-4")
        self.tools = self._setup_tools()
        self.memory = ConversationBufferMemory()
        self.agent = self._create_agent()
    
    def _setup_tools(self):
        return [
            WebSearchTool(),
            CalculatorTool(),
            FileReadTool(),
            FileWriteTool()
        ]
    
    def _create_agent(self):
        prompt = PromptTemplate(
            template="""You are a research assistant.
            
Your goal: {input}

Available tools: {tools}

{agent_scratchpad}""",
            input_variables=["input", "tools", "agent_scratchpad"]
        )
        return create_react_agent(self.llm, self.tools, prompt)
    
    def run(self, task):
        return self.agent_executor.invoke({"input": task})
```

### 2. Human-in-the-Loop

```python
# Add human confirmation for sensitive actions
from langchain.callbacks import HumanApprovalCallback

def approve_action(action):
    """Confirm before executing sensitive actions"""
    if action.tool == "send_email":
        response = input(f"Send email to {action.tool_input}? (yes/no)")
        return response.lower() == "yes"
    return True

agent_executor = AgentExecutor(
    agent=agent,
    tools=tools,
    callbacks=[HumanApprovalCallback(approve_func=approve_action)]
)
```

### 3. Observability

```python
# Track agent decisions
from langchain.callbacks import StdOutCallbackHandler

class AgentTracer(StdOutCallbackHandler):
    def __init__(self):
        self.trace = []
    
    def on_tool_start(self, serialized, input_str, **kwargs):
        self.trace.append({"tool": serialized["name"], "input": input_str})
    
    def on_tool_end(self, output, **kwargs):
        self.trace[-1]["output"] = output
    
    def get_trace(self):
        return self.trace

tracer = AgentTracer()
agent_executor = AgentExecutor(
    agent=agent,
    tools=tools,
    callbacks=[tracer]
)

# After execution
print(tracer.get_trace())
```

## Quick Reference

| Framework | Best For |
|-----------|----------|
| LangChain | General purpose, rich ecosystem |
| LlamaIndex | RAG-heavy agents |
| AutoGen | Multi-agent conversations |
| CrewAI | Role-based teams |
| Semantic Kernel | Enterprise, .NET focus |

## Summary

- Agents combine LLMs with tools and planning
- ReAct pattern: Reason then Act
- Always set iteration and time limits
- Clear tool descriptions improve performance
- Implement error handling for robustness
- Use memory for context persistence
- Consider human-in-the-loop for sensitive tasks

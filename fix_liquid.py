filepath = r"D:\Ai generator\opencode_workspace\interview\pages\_posts\2024-03-24-frontend.md"

with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

# Fix 1: Vue 3 Composition API (line 146-191)
old1 = """#### Vue 3 Composition API
```vue
<script setup>
import { ref, computed, onMounted, watch } from 'vue';
import { useRoute } from 'vue-router';
import { useUserStore } from '@/stores/user';

const route = useRoute();
const userStore = useUserStore();
const searchQuery = ref('');
const loading = ref(false);

// Computed properties
const filteredUsers = computed(() => {
  return userStore.users.filter(u =>
    u.name.toLowerCase().includes(searchQuery.value.toLowerCase())
  );
});

// Watchers
watch(searchQuery, async (newQuery) => {
  if (newQuery.length > 2) {
    loading.value = true;
    await userStore.searchUsers(newQuery);
    loading.value = false;
  }
});

// Lifecycle
onMounted(() => {
  userStore.fetchUsers();
});
</script>

<template>
  <div>
    <input v-model="searchQuery" placeholder="Search..." />
    <ul v-if="!loading">
      <li v-for="user in filteredUsers" :key="user.id">
        {{ user.name }}
      </li>
    </ul>
    <Spinner v-else />
  </div>
</template>
```"""

new1 = """{% raw %}
#### Vue 3 Composition API
```vue
<script setup>
import { ref, computed, onMounted, watch } from 'vue';
import { useRoute } from 'vue-router';
import { useUserStore } from '@/stores/user';

const route = useRoute();
const userStore = useUserStore();
const searchQuery = ref('');
const loading = ref(false);

// Computed properties
const filteredUsers = computed(() => {
  return userStore.users.filter(u =>
    u.name.toLowerCase().includes(searchQuery.value.toLowerCase())
  );
});

// Watchers
watch(searchQuery, async (newQuery) => {
  if (newQuery.length > 2) {
    loading.value = true;
    await userStore.searchUsers(newQuery);
    loading.value = false;
  }
});

// Lifecycle
onMounted(() => {
  userStore.fetchUsers();
});
</script>

<template>
  <div>
    <input v-model="searchQuery" placeholder="Search..." />
    <ul v-if="!loading">
      <li v-for="user in filteredUsers" :key="user.id">
        {{ user.name }}
      </li>
    </ul>
    <Spinner v-else />
  </div>
</template>
```
{% endraw %}"""

content = content.replace(old1, new1)

# Fix 2: Vue 3 Composition API Component (line 1091-1162)
old2 = """### Vue 3 Composition API Component
```vue
<script setup>
import { ref, computed, onMounted } from 'vue';

const todos = ref([]);
const newTodo = ref('');
const filter = ref('all');

const filteredTodos = computed(() => {
  switch (filter.value) {
    case 'active': return todos.value.filter(t => !t.done);
    case 'completed': return todos.value.filter(t => t.done);
    default: return todos.value;
  }
});

const stats = computed(() => ({
  total: todos.value.length,
  active: todos.value.filter(t => !t.done).length,
  completed: todos.value.filter(t => t.done).length,
}));

function addTodo() {
  if (!newTodo.value.trim()) return;
  todos.value.push({
    id: Date.now(),
    text: newTodo.value.trim(),
    done: false,
  });
  newTodo.value = '';
}

function removeTodo(id) {
  todos.value = todos.value.filter(t => t.id !== id);
}

onMounted(async () => {
  const res = await fetch('/api/todos');
  todos.value = await res.json();
});
</script>

<template>
  <div class="todo-app">
    <form @submit.prevent="addTodo">
      <input v-model="newTodo" placeholder="What needs to be done?" />
      <button type="submit">Add</button>
    </form>

    <div class="filters">
      <button :class="{ active: filter === 'all' }" @click="filter = 'all'">
        All ({{ stats.total }})
      </button>
      <button :class="{ active: filter === 'active' }" @click="filter = 'active'">
        Active ({{ stats.active }})
      </button>
      <button :class="{ active: filter === 'completed' }" @click="filter = 'completed'">
        Completed ({{ stats.completed }})
      </button>
    </div>

    <ul>
      <li v-for="todo in filteredTodos" :key="todo.id">
        <input type="checkbox" v-model="todo.done" />
        <span :class="{ done: todo.done }">{{ todo.text }}</span>
        <button @click="removeTodo(todo.id)">Delete</button>
      </li>
    </ul>
  </div>
</template>
```"""

new2 = """{% raw %}
### Vue 3 Composition API Component
```vue
<script setup>
import { ref, computed, onMounted } from 'vue';

const todos = ref([]);
const newTodo = ref('');
const filter = ref('all');

const filteredTodos = computed(() => {
  switch (filter.value) {
    case 'active': return todos.value.filter(t => !t.done);
    case 'completed': return todos.value.filter(t => t.done);
    default: return todos.value;
  }
});

const stats = computed(() => ({
  total: todos.value.length,
  active: todos.value.filter(t => !t.done).length,
  completed: todos.value.filter(t => t.done).length,
}));

function addTodo() {
  if (!newTodo.value.trim()) return;
  todos.value.push({
    id: Date.now(),
    text: newTodo.value.trim(),
    done: false,
  });
  newTodo.value = '';
}

function removeTodo(id) {
  todos.value = todos.value.filter(t => t.id !== id);
}

onMounted(async () => {
  const res = await fetch('/api/todos');
  todos.value = await res.json();
});
</script>

<template>
  <div class="todo-app">
    <form @submit.prevent="addTodo">
      <input v-model="newTodo" placeholder="What needs to be done?" />
      <button type="submit">Add</button>
    </form>

    <div class="filters">
      <button :class="{ active: filter === 'all' }" @click="filter = 'all'">
        All ({{ stats.total }})
      </button>
      <button :class="{ active: filter === 'active' }" @click="filter = 'active'">
        Active ({{ stats.active }})
      </button>
      <button :class="{ active: filter === 'completed' }" @click="filter = 'completed'">
        Completed ({{ stats.completed }})
      </button>
    </div>

    <ul>
      <li v-for="todo in filteredTodos" :key="todo.id">
        <input type="checkbox" v-model="todo.done" />
        <span :class="{ done: todo.done }">{{ todo.text }}</span>
        <button @click="removeTodo(todo.id)">Delete</button>
      </li>
    </ul>
  </div>
</template>
```
{% endraw %}"""

content = content.replace(old2, new2)

# Verify
import re
stripped = re.sub(r'{% raw %}.*?{% endraw %}', '', content, flags=re.DOTALL)
remaining = re.findall(r'\{\{', stripped)
if remaining:
    print(f"WARNING: {len(remaining)} unescaped {{ found outside raw blocks")
else:
    print("OK: All {{ }} properly escaped")

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)

print(f"File updated: {filepath}")

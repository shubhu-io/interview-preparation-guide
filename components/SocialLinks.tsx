"use client";

import { useMemo, useRef } from "react";
import { motion } from "framer-motion";
import {
  Linkedin,
  Github,
  Globe,
  FileText,
  Mail,
  Twitter,
  Code2,
  Feather,
  Hash,
  ExternalLink,
} from "lucide-react";

type LucideIcon = typeof Linkedin;

interface SocialLinkConfig {
  name: string;
  url: string;
  icon: LucideIcon;
  color: string;
  subtitle?: string;
}

const SOCIAL_LINKS: SocialLinkConfig[] = [
  {
    name: "LinkedIn",
    url: "https://linkedin.com/in/shubhu-io",
    icon: Linkedin,
    color: "#0A66C2",
    subtitle: "Connect professionally",
  },
  {
    name: "GitHub",
    url: "https://github.com/shubhu-io",
    icon: Github,
    color: "#f0f6fc",
    subtitle: "Open source & projects",
  },
  {
    name: "Portfolio",
    url: "https://shubhu-io.github.io",
    icon: Globe,
    color: "#a855f7",
    subtitle: "Work & case studies",
  },
  {
    name: "Resume",
    url: "/resume.pdf",
    icon: FileText,
    color: "#22c55e",
    subtitle: "Download CV",
  },
  {
    name: "Email",
    url: "mailto:hello@shubhu.io",
    icon: Mail,
    color: "#f43f5e",
    subtitle: "Get in touch",
  },
  {
    name: "Twitter / X",
    url: "https://x.com/shubhu_io",
    icon: Twitter,
    color: "#e2e8f0",
    subtitle: "Daily updates",
  },
  {
    name: "LeetCode",
    url: "https://leetcode.com/shubhu-io",
    icon: Code2,
    color: "#facc15",
    subtitle: "DSA practice",
  },
  {
    name: "HackerRank",
    url: "https://hackerrank.com/shubhu-io",
    icon: Hash,
    color: "#22c55e",
    subtitle: "Coding challenges",
  },
  {
    name: "Medium",
    url: "https://medium.com/@shubhu-io",
    icon: Feather,
    color: "#f5f5f5",
    subtitle: "Technical writing",
  },
  {
    name: "Dev.to",
    url: "https://dev.to/shubhu-io",
    icon: Hash,
    color: "#f5f5f5",
    subtitle: "Community posts",
  },
];

function useSocialLinks(overrides?: Partial<SocialLinkConfig>[]) {
  return useMemo(() => {
    if (!overrides) return SOCIAL_LINKS.filter(Boolean);
    return SOCIAL_LINKS.map((link) => {
      const override = overrides.find((o) => o.name === link.name);
      return override ? { ...link, ...override } : link;
    }).filter(Boolean);
  }, [overrides]);
}

const containerVariants = {
  hidden: { opacity: 0 },
  visible: {
    opacity: 1,
    transition: { staggerChildren: 0.07, delayChildren: 0.1 },
  },
};

const cardVariants = {
  hidden: { opacity: 0, y: 24 },
  visible: {
    opacity: 1,
    y: 0,
    transition: { type: "spring", stiffness: 100, damping: 20, mass: 1 },
  },
};

function GlowBorder({ color }: { color: string }) {
  return (
    <div
      className="pointer-events-none absolute inset-0 rounded-2xl opacity-0 transition-opacity duration-500 group-hover:opacity-100"
      style={{
        background: `conic-gradient(from 0deg at 50% 50%, transparent 0deg, ${color}40 60deg, transparent 120deg, ${color}20 180deg, transparent 240deg, ${color}40 300deg, transparent 360deg)`,
        mask: "linear-gradient(#fff 0 0) content-box, linear-gradient(#fff 0 0)",
        maskComposite: "exclude",
        WebkitMaskComposite: "xor",
        padding: "1px",
      }}
    />
  );
}

function MouseGlow() {
  const ref = useRef<HTMLDivElement>(null);

  const handleMouseMove = (e: React.MouseEvent<HTMLDivElement>) => {
    if (!ref.current) return;
    const rect = ref.current.getBoundingClientRect();
    const x = ((e.clientX - rect.left) / rect.width) * 100;
    const y = ((e.clientY - rect.top) / rect.height) * 100;
    ref.current.style.setProperty("--mouse-x", `${x}%`);
    ref.current.style.setProperty("--mouse-y", `${y}%`);
  };

  return (
    <div
      ref={ref}
      onMouseMove={handleMouseMove}
      className="pointer-events-none absolute inset-0 rounded-2xl opacity-0 transition-opacity duration-300 group-hover:opacity-100"
      style={{
        background:
          "radial-gradient(600px circle at var(--mouse-x, 50%) var(--mouse-y, 50%), rgba(255,255,255,0.06), transparent 40%)",
      }}
    />
  );
}

function SocialCard({ link }: { link: SocialLinkConfig }) {
  const Icon = link.icon;

  return (
    <motion.a
      href={link.url}
      target="_blank"
      rel="noopener noreferrer"
      aria-label={`Visit ${link.name} profile`}
      variants={cardVariants}
      whileHover={{ scale: 1.03 }}
      whileFocus={{ scale: 1.03 }}
      className="group relative flex flex-col items-center justify-center gap-3 rounded-2xl border border-white/[0.06] bg-white/[0.03] p-6 backdrop-blur-xl transition-shadow duration-300 hover:shadow-[0_0_30px_-6px_var(--hover-color)] focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-purple-500 focus-visible:ring-offset-2 focus-visible:ring-offset-gray-950"
      style={
        {
          "--hover-color": `${link.color}40`,
        } as React.CSSProperties
      }
    >
      <GlowBorder color={link.color} />
      <MouseGlow />

      <span className="relative z-10 flex h-12 w-12 items-center justify-center rounded-xl bg-white/[0.04] transition-all duration-300 group-hover:bg-white/[0.08] group-hover:shadow-[0_0_20px_-4px_var(--hover-color)]">
        <Icon
          className="h-6 w-6 text-gray-400 transition-all duration-300 group-hover:text-[var(--hover-color)]"
          style={
            {
              "--hover-color": link.color,
            } as React.CSSProperties
          }
          aria-hidden="true"
        />
      </span>

      <div className="relative z-10 text-center">
        <p className="text-sm font-semibold text-gray-100 transition-colors duration-300 group-hover:text-white">
          {link.name}
        </p>
        {link.subtitle && (
          <p className="mt-0.5 text-xs text-gray-500">{link.subtitle}</p>
        )}
      </div>

      <ExternalLink
        className="absolute right-3 top-3 h-3.5 w-3.5 text-gray-600 opacity-0 transition-all duration-300 group-hover:opacity-100 group-hover:text-gray-400"
        aria-hidden="true"
      />
    </motion.a>
  );
}

interface SocialLinksProps {
  title?: string;
  subtitle?: string;
  className?: string;
  maxCards?: number;
  links?: Partial<SocialLinkConfig>[];
  filter?: string[];
}

export default function SocialLinks({
  title = "Connect",
  subtitle = "Find me across the web",
  className = "",
  maxCards,
  links,
  filter,
}: SocialLinksProps) {
  const allLinks = useSocialLinks(links);

  const available = useMemo(() => {
    let result = allLinks;
    if (filter && filter.length > 0) {
      const allowed = new Set(filter);
      result = result.filter((l) => allowed.has(l.name));
    }
    if (maxCards && maxCards > 0) {
      result = result.slice(0, maxCards);
    }
    return result;
  }, [allLinks, filter, maxCards]);

  if (available.length === 0) return null;

  const singleCard = available.length === 1;

  return (
    <section className={`w-full px-4 py-16 ${className}`}>
      <motion.div
        className="mx-auto max-w-6xl"
        initial="hidden"
        whileInView="visible"
        viewport={{ once: true, margin: "-80px" }}
        variants={containerVariants}
      >
        {(title || subtitle) && (
          <motion.div
            className="mb-10 text-center"
            initial={{ opacity: 0, y: 16 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.5, ease: "easeOut" }}
          >
            {title && <h2 className="text-xl font-bold text-gray-100">{title}</h2>}
            {subtitle && (
              <p className="mt-2 text-sm text-gray-400">{subtitle}</p>
            )}
          </motion.div>
        )}

        {singleCard ? (
          <div className="flex justify-center">
            <div className="w-full max-w-xs">
              <SocialCard link={available[0]} />
            </div>
          </div>
        ) : (
          <div className="grid grid-cols-2 gap-4 sm:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5">
            {available.map((link) => (
              <SocialCard key={link.name} link={link} />
            ))}
          </div>
        )}
      </motion.div>
    </section>
  );
}

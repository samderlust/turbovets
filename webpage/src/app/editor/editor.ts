import { Component, signal, computed, ElementRef, ViewChild } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-editor',
  imports: [FormsModule, CommonModule],
  templateUrl: './editor.html',
  styleUrl: './editor.css'
})
export class Editor {
  @ViewChild('editor') editor!: ElementRef<HTMLTextAreaElement>;

  protected readonly content = signal(`# Welcome to Knowledge Base

## Getting Started
This is a **markdown editor** with live preview. You can write documentation using markdown syntax.

### Features
- Live preview
- Markdown toolbar
- Responsive layout
- Auto-save functionality

### Markdown Examples

**Bold text** and *italic text*

\`inline code\` and code blocks:

\`\`\`javascript
function hello() {
  console.log("Hello, World!");
}
\`\`\`

> This is a blockquote

- List item 1
- List item 2
- List item 3

[Link to example](https://example.com)

---

Start writing your documentation here...`);

  protected readonly savedMessage = signal(false);
  protected readonly activeTab = signal<'editor' | 'preview'>('editor');

  protected readonly renderedContent = computed(() => {
    return this.markdownToHtml(this.content());
  });

  protected save() {
    // Simulate save operation
    this.savedMessage.set(true);
    setTimeout(() => this.savedMessage.set(false), 2000);
  }

  protected updateContent(event: Event) {
    const target = event.target as HTMLTextAreaElement;
    this.content.set(target.value);
  }

  protected setActiveTab(tab: 'editor' | 'preview') {
    this.activeTab.set(tab);
  }

  protected insertMarkdown(before: string, after: string) {
    const textarea = document.querySelector('textarea') as HTMLTextAreaElement;
    if (!textarea) return;

    const start = textarea.selectionStart;
    const end = textarea.selectionEnd;
    const selectedText = textarea.value.substring(start, end);
    const newText = before + selectedText + after;

    const newContent =
      textarea.value.substring(0, start) +
      newText +
      textarea.value.substring(end);

    this.content.set(newContent);

    // Set cursor position after insertion
    setTimeout(() => {
      textarea.focus();
      textarea.setSelectionRange(start + before.length, start + before.length + selectedText.length);
    });
  }

  private markdownToHtml(markdown: string): string {
    let html = markdown;

    // Headers
    html = html.replace(/^### (.*$)/gim, '<h3 class="text-lg font-semibold mt-4 mb-2">$1</h3>');
    html = html.replace(/^## (.*$)/gim, '<h2 class="text-xl font-bold mt-6 mb-3">$1</h2>');
    html = html.replace(/^# (.*$)/gim, '<h1 class="text-2xl font-bold mt-8 mb-4">$1</h1>');

    // Bold and Italic
    html = html.replace(/\*\*(.*?)\*\*/g, '<strong class="font-bold">$1</strong>');
    html = html.replace(/\*(.*?)\*/g, '<em class="italic">$1</em>');

    // Code blocks
    html = html.replace(/```(\w+)?\n([\s\S]*?)```/g, '<pre class="bg-gray-100 p-3 rounded mt-2 mb-2 overflow-x-auto"><code class="text-sm">$2</code></pre>');

    // Inline code
    html = html.replace(/`(.*?)`/g, '<code class="bg-gray-100 px-1 py-0.5 rounded text-sm font-mono">$1</code>');

    // Links
    html = html.replace(/\[([^\]]+)\]\(([^)]+)\)/g, '<a href="$2" class="text-blue-600 hover:underline" target="_blank">$1</a>');

    // Blockquotes
    html = html.replace(/^> (.*$)/gim, '<blockquote class="border-l-4 border-gray-300 pl-4 italic text-gray-600 my-2">$1</blockquote>');

    // Lists
    html = html.replace(/^\- (.*$)/gim, '<li class="ml-4">• $1</li>');
    html = html.replace(/(<li.*<\/li>)/s, '<ul class="my-2">$1</ul>');

    // Horizontal rules
    html = html.replace(/^---$/gim, '<hr class="border-gray-300 my-4">');

    // Line breaks
    html = html.replace(/\n/g, '<br>');

    return html;
  }
}

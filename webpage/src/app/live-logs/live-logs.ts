import { Component, signal, OnInit, OnDestroy, ElementRef, ViewChild, AfterViewChecked } from '@angular/core';
import { CommonModule } from '@angular/common';

interface LogEntry {
  timestamp: Date;
  level: 'INFO' | 'WARN' | 'ERROR';
  message: string;
}

@Component({
  selector: 'app-live-logs',
  imports: [CommonModule],
  templateUrl: './live-logs.html',
  styleUrl: './live-logs.css'
})
export class LiveLogs implements OnInit, OnDestroy, AfterViewChecked {
  @ViewChild('logsContainer') logsContainer!: ElementRef;
  
  protected readonly logs = signal<LogEntry[]>([]);
  private interval?: number;
  private shouldScroll = true;

  ngOnInit() {
    this.startLogGeneration();
  }

  ngOnDestroy() {
    if (this.interval) {
      clearInterval(this.interval);
    }
  }

  ngAfterViewChecked() {
    if (this.shouldScroll) {
      this.scrollToBottom();
    }
  }

  private startLogGeneration() {
    const messages = [
      'User authentication successful',
      'Database connection established',
      'Cache miss for user session',
      'API request processed',
      'File upload completed',
      'Email notification sent',
      'Background job started',
      'Memory usage: 75%',
      'New user registration',
      'Payment processed successfully'
    ];

    const levels: LogEntry['level'][] = ['INFO', 'WARN', 'ERROR'];

    this.interval = window.setInterval(() => {
      const newLog: LogEntry = {
        timestamp: new Date(),
        level: levels[Math.floor(Math.random() * levels.length)],
        message: messages[Math.floor(Math.random() * messages.length)]
      };

      this.logs.update(logs => [...logs, newLog]);
      
      // Keep only last 100 logs
      if (this.logs().length > 100) {
        this.logs.update(logs => logs.slice(-100));
      }
    }, 2000);
  }

  private scrollToBottom() {
    try {
      this.logsContainer.nativeElement.scrollTop = this.logsContainer.nativeElement.scrollHeight;
    } catch (err) {}
  }

  protected clearLogs() {
    this.logs.set([]);
  }
}
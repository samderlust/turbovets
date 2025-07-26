import { Component, signal, computed } from '@angular/core';
import { CommonModule } from '@angular/common';

interface Ticket {
  id: number;
  subject: string;
  status: 'Open' | 'In Progress' | 'Closed';
  createdAt: Date;
}

@Component({
  selector: 'app-ticket-viewer',
  imports: [CommonModule],
  templateUrl: './ticket-viewer.html',
  styleUrl: './ticket-viewer.css'
})
export class TicketViewer {
  private readonly allTickets = signal<Ticket[]>([
    { id: 1, subject: 'Login issues', status: 'Open', createdAt: new Date('2024-01-15') },
    { id: 2, subject: 'Payment processing error', status: 'In Progress', createdAt: new Date('2024-01-14') },
    { id: 3, subject: 'Feature request: Dark mode', status: 'Closed', createdAt: new Date('2024-01-13') },
    { id: 4, subject: 'Bug: Page not loading', status: 'Open', createdAt: new Date('2024-01-12') },
    { id: 5, subject: 'Account deletion request', status: 'In Progress', createdAt: new Date('2024-01-11') }
  ]);

  protected readonly selectedFilter = signal<string>('All');
  
  protected readonly filteredTickets = computed(() => {
    const filter = this.selectedFilter();
    if (filter === 'All') return this.allTickets();
    return this.allTickets().filter(ticket => ticket.status === filter);
  });

  protected setFilter(filter: string) {
    this.selectedFilter.set(filter);
  }
}
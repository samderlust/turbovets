import { Routes } from '@angular/router';

export const routes: Routes = [
    { path: '', redirectTo: '/tickets', pathMatch: 'full' },
    { path: 'tickets', loadComponent: () => import('./ticket-viewer/ticket-viewer').then(m => m.TicketViewer) },
    { path: 'editor', loadComponent: () => import('./editor/editor').then(m => m.Editor) },
    { path: 'logs', loadComponent: () => import('./live-logs/live-logs').then(m => m.LiveLogs) }
];

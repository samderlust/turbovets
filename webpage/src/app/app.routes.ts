import { Routes } from '@angular/router';

export const routes: Routes = [
    { path: '', redirectTo: '/tickets', pathMatch: 'full' },
    { path: 'tickets', loadComponent: () => import('./ticket-viewer/ticket-viewer').then(m => m.TicketViewer) },
    { path: 'knowledgebase', loadComponent: () => import('./knowledgebase-editor/knowledgebase-editor').then(m => m.KnowledgebaseEditor) },
    { path: 'logs', loadComponent: () => import('./live-logs/live-logs').then(m => m.LiveLogs) }
];

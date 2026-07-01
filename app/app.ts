import { Application } from '@nativescript/core';
import { startAngularApp } from './main.aot';

// Global error handlers
Application.on(Application.launchEvent, (args) => {
    console.log('🚀 Mobile Fish App Started');
});

Application.on(Application.displayedEvent, (args) => {
    console.log('📱 App Displayed');
});

Application.on(Application.uncaughtErrorEvent, (args) => {
    console.error('❌ Uncaught Error:', args.error);
});

Application.run({ moduleName: 'app-root' });
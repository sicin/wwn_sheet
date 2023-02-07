import './globals.css';

export default function RootLayout({ children }: { children: React.ReactNode }) {
    return (
        <html lang="en">
            <head>
                <title>Layout.tsx</title>
                <meta charSet="UTF-8" />
                <meta name="description" content="" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <meta name="author" content="Richard Sicinski" />
                <link rel="icon" href="/favicon.ico" />
                <meta name="theme-color" content="#ffffff" />
            </head>
            <body>{children}</body>
        </html>
    );
}

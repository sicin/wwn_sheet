import Head from 'next/head';
// import Image from 'next/image'
import { z } from 'zod';
import { Averia_Sans_Libre } from '@next/font/google';

const averia = Averia_Sans_Libre({ weight: ['400', '700'], subsets: ['latin'] });

export default function Home() {
    return (
        <>
            <Head>
                <title>WWN Character Sheet</title>
                <meta charSet="UTF-8" />
                <meta name="description" content="" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <meta name="author" content="Richard Sicinski" />
                <link rel="icon" href="/favicon.ico" />
                <meta name="theme-color" content="#ffffff" />
            </Head>

            <main className={averia.className}>
                <h1 className="font-bold text-9xl">Hello world</h1>
            </main>
        </>
    );
}

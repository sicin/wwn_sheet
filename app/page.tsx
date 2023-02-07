import { Averia_Sans_Libre } from '@next/font/google';

const averia = Averia_Sans_Libre({ weight: ['400', '700'], subsets: ['latin'] });
// `app/page.js` is the UI for the root `/` URL
export default function Page() {
    return (
        <main className={averia.className}>
            <h1 className="font-bold text-9xl">Hello world</h1>
            <h2 className="font-bold text-2xl">WWN Character Sheet</h2>
        </main>
    );
}

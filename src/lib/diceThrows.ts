export const d2Throw = () => Math.floor(Math.random() * 2) + 1;
export const d4Throw = () => Math.floor(Math.random() * 4) + 1;
export const d6Throw = () => Math.floor(Math.random() * 6) + 1;
export const d8Throw = () => Math.floor(Math.random() * 8) + 1;
export const d10Throw = () => Math.floor(Math.random() * 10) + 1;
export const d12Throw = () => Math.floor(Math.random() * 12) + 1;
export const d20Throw = () => Math.floor(Math.random() * 20) + 1;

export const doubleThrow = (throwFn: () => number) => throwFn() + throwFn();

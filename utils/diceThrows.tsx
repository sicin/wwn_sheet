export const d2Throw = () => {
    return Math.floor(Math.random() * 2) + 1;
};

export const d4Throw = () => {
    return Math.floor(Math.random() * 4) + 1;
};

export const d6Throw = () => {
    return Math.floor(Math.random() * 6) + 1;
};

export const d8Throw = () => {
    return Math.floor(Math.random() * 8) + 1;
};

export const d10Throw = () => {
    return Math.floor(Math.random() * 10) + 1;
};

export const d12Throw = () => {
    return Math.floor(Math.random() * 12) + 1;
};

export const d20Throw = () => {
    return Math.floor(Math.random() * 20) + 1;
};

export const doubleThrow = <T extends number>(throwFn: () => T) => {
    const [a, b] = [throwFn(), throwFn()];
    return a + b;
};

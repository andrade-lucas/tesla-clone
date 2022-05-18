import React from 'react';
import useWrapperScroll from '../useWrapperScroll';

import { Container } from './styles';

interface Props {
    children: React.ReactNode
}

const ModelOverlay: React.FC<Props> = ({ children }) => {
    const { scrollY } = useWrapperScroll();

    return <Container>{children}</Container>
}

export default ModelOverlay;

import React from 'react';
import { render } from '@testing-library/react';
import App from './App';

test('renders enter your index form', () => {
  const { getByText } = render(<App />);
  const linkElement = getByText(/enter your index/i);
  expect(linkElement).toBeInTheDocument();
});

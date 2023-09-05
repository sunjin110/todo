import React from "react";
import './App.css';
import TopPage from './ui/pages/index';

import { BrowserRouter, Routes, Route } from 'react-router-dom';
import SignUpPage from './ui/pages/signup';

const App = () : JSX.Element => {
  return (
    <div className='App'>
      <BrowserRouter>
      <Routes>
        <Route path='/' element={<TopPage />} />
        <Route path='signup' element={<SignUpPage />} />
      </Routes>
    </BrowserRouter>
    </div>
  );
};

export default App;

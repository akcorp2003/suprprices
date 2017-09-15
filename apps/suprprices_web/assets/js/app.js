import React                    from 'react';
import ReactDOM                 from 'react-dom';
import { browserHistory }       from 'react-router';
import { syncHistoryWithStore } from 'react-router-redux';
import MainPage                 from './components/mainpage';
  
ReactDOM.render(
    <MainPage/>,
    document.getElementById("hello-world")
)
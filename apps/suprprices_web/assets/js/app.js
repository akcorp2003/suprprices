import React                    from 'react';
import ReactDOM                 from 'react-dom';
import { browserHistory }       from 'react-router';
import { syncHistoryWithStore } from 'react-router-redux';

/*const store = configureStore(browserHistory);
const history = syncHistoryWithStore(browserHistory, store);

const target = document.getElementById('main_container');
const node = <Root routerHistory={history} store={store} />;

ReactDOM.render(node, target);*/

class HelloWorld extends React.Component {
    render() {
      return (<h1>Hello World!</h1>)
    }
  }
  
  ReactDOM.render(
    <HelloWorld/>,
    document.getElementById("hello-world")
  )
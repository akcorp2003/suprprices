import React from 'react'
import ReactDOM from 'react-dom'
import { Provider } from 'react-redux'
import { createStore } from 'redux'
import rootReducer from './reducers'
import App from './components/App'
let store = createStore(rootReducer)
class HelloWorld extends React.Component {
  render() {
    return(
    <Provider store={store}>
      <App />
      </Provider>)
    
  }
}

ReactDOM.render(<HelloWorld/>,
document.getElementById("hello-world")
)

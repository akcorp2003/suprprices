import 'babel-polyfill'
import React from 'react';
import { render } from 'react-dom';
import ReactDOM from 'react-dom';
//import { BrowserRouter, Switch, Route } from 'react-router';
import { BrowserRouter, Route, Switch} from 'react-router-dom';
import CitiesPage from './components/cities/citiesPage';
import AboutPage from './components/about/aboutpage';
import MainPage from './components/mainpage';
import GroceriesPage from './components/groceries/GroceriesPage';
import StoresPage from './components/stores/StorePage';

class App extends React.Component {
    render() {
        return (
            <BrowserRouter>
                <div>
                    <Switch>
                        <Route exact path='/' component={MainPage} />
                        <Route path='/about' component={AboutPage} />
                        <Route path='/cities' component={CitiesPage} />
                        <Route path='/groceries' component={GroceriesPage} />
                        <Route path='/stores' component={StoresPage} />
                    </Switch>
                </div>
            </BrowserRouter>
        );
    }
}

ReactDOM.render(<App />, document.getElementById("hello-world"));
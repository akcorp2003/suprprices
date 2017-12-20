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
import notFoundPage from './components/404NotFound';
import ManageCitiesPage from './components/cities/manageCityPage';
import MainHeader from './components/common/MainHeader';

class App extends React.Component {
    render() {
        return (
            <div>
                <BrowserRouter>
                    <div>
                        <MainHeader />
                        <Switch>
                            <Route exact path='/' component={MainPage} />
                            <Route path='/about' component={AboutPage} />
                            <Route path='/cities' component={CitiesPage} />
                            <Route path='/city' component={ManageCitiesPage} />
                            <Route path='/groceries' component={GroceriesPage} />
                            <Route path='/stores' component={StoresPage} />
                            <Route component={notFoundPage} />
                        </Switch>
                    </div>
                    
                </BrowserRouter>
                
            </div>
        );
    }
}

ReactDOM.render(<App />, document.getElementById("hello-world"));
import 'babel-polyfill'
import React from 'react';
import { render } from 'react-dom';
import ReactDOM from 'react-dom';
//import { BrowserRouter, Switch, Route } from 'react-router';
import { BrowserRouter, Route, Switch} from 'react-router-dom';
import CitiesPage from './components/cities/citiesPage';
import AboutPage from './components/about/aboutpage';
import MainPage from './components/mainpage';

class App extends React.Component {
    render() {
        return (
            <BrowserRouter>
                <div>
                    <Switch>
                        <Route exact path='/' component={MainPage} />
                        <Route path='/about' component={AboutPage} />
                        <Route path='/cities' component={CitiesPage} />
                    </Switch>
                </div>
            </BrowserRouter>
        );
    }
}

ReactDOM.render(<App />, document.getElementById("hello-world"));
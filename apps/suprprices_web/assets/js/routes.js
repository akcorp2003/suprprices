import React from 'react';
import {Route, IndexRoute, Switch} from 'react-router';
import CitiesPage from './components/cities/citiesPage';
import AboutPage from './components/about/aboutpage';
import MainPage from './components/mainpage';
import GroceriesPage from './components/groceries/GroceriesPage';
import StoresPage from './components/stores/StorePage';

export default (
    <Switch>
      <Route exact path='/' component={MainPage} />
      <Route path='/about' component={AboutPage} />
      <Route path='/cities' component={CitiesPage} />
      <Route path='/groceries' component={GroceriesPage} />
      <Route path='/stores' component={StoresPage} />
    </Switch>
);
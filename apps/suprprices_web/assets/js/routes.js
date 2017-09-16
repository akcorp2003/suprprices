import React from 'react'
import {Route, IndexRoute, Switch} from 'react-router'
import CitiesPage from './components/cities/citiesPage'
import AboutPage from './components/about/aboutpage'
import MainPage from './components/mainpage'
import App from './components/app'

export default (
    <Switch>
      <Route exact path='/' component={MainPage} />
      <Route path='/about' component={AboutPage} />
      <Route path='/cities' component={CitiesPage} />
    </Switch>
);
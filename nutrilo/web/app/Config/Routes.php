<?php namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes(true);

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (file_exists(SYSTEMPATH . 'Config/Routes.php'))
{
	require SYSTEMPATH . 'Config/Routes.php';
}

/**
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Login');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
$routes->setAutoRoute(true);

/**
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
$routes->get('/', 'Admin/Home::index');

// MEMBER
$routes->get('/member', 'Admin\Member::index');
$routes->get('/member/register', 'Admin\Member::register');
$routes->get('/member/register/update', 'Admin\Member::update');
$routes->get('/member/register', 'Admin\Member::register');

// CATERING
$routes->get('/catering', 'Admin\Catering_batch::index');
$routes->get('/catering/order', 'Admin\Catering_order::index');
$routes->get('/catering/batch', 'Admin\Catering_open_batch::index');
$routes->get('/catering/buyer', 'Admin\Catering_buyer::index');
$routes->get('/catering/menu', 'Admin\Menu::index');
$routes->get('/catering/menu/add', 'Admin\Menu::add');
$routes->get('/catering/menu/delete', 'Admin\Menu::delete');
$routes->get('/catering/buyer/add', 'Admin\Catering_buyer::add');
$routes->get('/catering/save', 'Admin\Catering_order::index');
$routes->get('/catering/print-order', 'Admin\Catering_order::printOrder');
$routes->get('/catering/driver', 'Admin\Driver::setDriver');
$routes->get('/catering/buyer-edit', 'Admin\Catering_buyer::edit');
$routes->get('/catering/buyer-delete', 'Admin\Catering_buyer::delete');
$routes->get('/catering/order/delete/(:num)/(:num)', 'Admin\Catering_order::delete/$1/$2');

// MARKET
$routes->get('/market', 'Admin\Market::index');

// STOCK	
$routes->get('/stock', 'Admin\Stock::index');
$routes->get('/stock/data', 'Admin\Stock::showData');
$routes->get('/stock/quantity', 'Admin\Stock::showStock');
$routes->get('/stock/in-stock', 'Admin\Stock_in_out::inStock');
$routes->get('/stock/in-stock/add', 'Admin\Stock_in_out::addInStock');
$routes->get('/stock/in-stock/add-shopping-item', 'Admin\Stock_in_out::addItemToStock');
$routes->get('/stock/in-stock/edit', 'Admin\Stock_in_out::editInStock');
$routes->get('/stock/in-stock/delete', 'Admin\Stock_in_out::deleteInStock');

$routes->get('/stock/out-stock', 'Admin\Stock_in_out::outStock');
$routes->get('/stock/out-stock/add', 'Admin\Stock_in_out::addOutStock');
$routes->get('/stock/out-stock/edit', 'Admin\Stock_in_out::editOutStock');
$routes->get('/stock/out-stock/delete', 'Admin\Stock_in_out::deleteOutStock');

// SHOPPING
$routes->get('/shopping', 'Admin\Shopping::index');
$routes->get('/shopping/plan', 'Admin\Shopping::shoppingPlan');
$routes->get('/shopping/plan/add', 'Admin\Shopping::shoppingPlanAdd');
$routes->get('/shopping/plan/edit', 'Admin\Shopping::shoppingPlanEdit');
$routes->get('/shopping/plan/delete', 'Admin\Shopping::deleteShoppingPlan');
$routes->get('/shopping/data', 'Admin\Shopping::shoppingAction');
$routes->get('/shopping/data/add', 'Admin\Shopping::shoppingActionAdd');
$routes->get('/shopping/data/add-plan', 'Admin\Shopping::shoppingActionAddPlan');
$routes->get('/shopping/data/edit', 'Admin\Shopping::shoppingActionEdit');
$routes->get('/shopping/data/delete', 'Admin\Shopping::deleteShopping');


// REST API
$routes->get('/name-search/(:segment)', 'Admin\Rest_api::index/$1');
$routes->post('/active-buyer/(:num)', 'Admin\Rest_api::setActiveBuyer/$1');
$routes->post('/inactive-buyer/(:num)', 'Admin\Rest_api::setInactiveBuyer/$1');
$routes->post('/finish-delivery/(:num)', 'Admin\Rest_api::setFinishDelivery/$1');
$routes->post('/last-finish-delivery/(:num)', 'Admin\Rest_api::setLastFinishDelivery/$1');
$routes->post('/send-sms/(:any)/(:num)/(:num)', 'Admin\Rest_api::sendSMS/$1/$2/$3');
$routes->post('/send-first-sms/(:any)/(:any)/(:num)/(:num)', 'Admin\Rest_api::sendFirstSMS/$1/$2/$3/$4');
$routes->get('/api-test', 'Admin\Rest_api::apiTest');
$routes->post('/create-order/(:num)/(:num)/(:any)', 'Admin\Rest_api::createOrder/$1/$2/$3');
$routes->post('/price-calculation/(:any)', 'Admin\Rest_api::priceCalculation/$1');

// DRIVER	
$routes->get('/delivery', 'Admin\Driver::deliveryRoute');
$routes->get('/driver/driver-order', 'Admin\Driver::driverOrder');


// REPORT
$routes->get('/report', 'Admin\Report::index');

$routes->get('/', 'User/Home_user::index');

$routes->get('/login', 'Admin\Login::index');
$routes->get('/logout', 'Admin\User::logout');
/**
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need to it be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (file_exists(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php'))
{
	require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}

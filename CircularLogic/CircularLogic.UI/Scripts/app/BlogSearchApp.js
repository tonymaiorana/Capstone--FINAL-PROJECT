var app = angular.module('angularTable', ['angularUtils.directives.dirPagination']);

//app.config(function ($routeProvider) {
//    $routeProvider
//        .when('/blogs', {
//            controller: 'listdata',
//            templateUrl: '/AngularViews/BlogSearchList.html'
//        })
//        .otherwise({ redirectTo: '/blogs' });
//});


app.controller('listdata',function($scope, $http){
	$scope.posts = []; //declare an empty array
	$http.get("/api/BlogPostAPI/GetPreviews").success(function(response){ 
	    $scope.posts = response;  //ajax request to fetch data into $scope.data
	    $scope.sort('DateTicks');
	});
	
	$scope.sort = function(keyname){
		$scope.sortKey = keyname;   //set the sortKey to the param passed
		$scope.reverse = true; //if true make it false and vice versa
	}
});
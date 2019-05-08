({
closeModal: function(component, event, helper){
         var navToMovieTab = $A.get("e.force:navigateToObjectHome");
        navToMovieTab.setParams({
             "scope": "Movie__c"
         });
         navToMovieTab.fire();
},
searchMovie: function(component, event, helper) {
         var searchCriteria = component.get('v.SearchCriteria');
         helper.calloutSearch(component, helper,  searchCriteria);
}
})
({
    searchMovie: function(component, event, helper) {
        var searchCriteria = component.get('v.SearchCriteria');
        helper.calloutSearch(component, helper,  searchCriteria);
    },
    insertMovies: function(component, event, helper){
        // check all the movies that are selected and insert these in the database
        var lstMovies = component.get('v.lstMovies');
        if (lstMovies.length > 0){
            var moviesSelected = [];
            lstMovies.forEach(function(value, index, array){
                if (value.bIsSelected){
                    moviesSelected.push(value);
                }
            });
            if (moviesSelected.length > 0){
                helper.insertSelectedMovies(component, event, helper, moviesSelected);
            }
        }
    },
    closeModal: function(component, event, helper){
        var navToMovieTab = $A.get("e.force:navigateToObjectHome");
        navToMovieTab.setParams({
            "scope": "Movie__c"
        });
        navToMovieTab.fire();
    }
})
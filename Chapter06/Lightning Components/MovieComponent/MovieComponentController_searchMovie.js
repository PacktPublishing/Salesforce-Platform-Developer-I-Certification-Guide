searchMovie: function(component, event, helper) {
        var searchCriteria = component.get('v.SearchCriteria');
        helper.calloutSearch(component, helper,  searchCriteria);
}
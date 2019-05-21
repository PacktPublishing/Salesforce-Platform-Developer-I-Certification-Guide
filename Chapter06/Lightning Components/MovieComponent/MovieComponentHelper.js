calloutSearch: function(component, helper, searchCriteria){
        var action = component.get('c.searchMovies');
        action.setParams({
            searchTerm: searchCriteria
        });
        action.setCallback(this, function (result) {
            if (result.getState() === 'SUCCESS'){
                component.set('v.lstMovies', result.getReturnValue());
                component.set('v.search', true);
                component.set('v.numberOfMovies', result.getReturnValue().length);
            }
        });

        $A.enqueueAction(action);
}
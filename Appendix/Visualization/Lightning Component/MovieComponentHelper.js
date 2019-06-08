({
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
            } else {
                helper.showToast(component, event, helper, 'Shit happens', 'error','No movie found ??');
            }
        });

        $A.enqueueAction(action);

    },
    insertSelectedMovies: function(component, event, helper, movies){
        var action = component.get('c.insertTheSelectedMovies');
        action.setParams({
            sMovies: movies
        });
        action.setCallback(this, function (result) {
            if (result.getState() === 'SUCCESS'){
                helper.navigateToMovieTab(component,event,helper, result.getReturnValue());
            } else if (result.getState() === 'ERROR'){
                var errors = result.getError();
                if (errors){
                    if (errors[0] && errors[0].message){
                        helper.showToast(component,event,helper,errors[0].message,'error','Error');
                    }
                }
            }
        });

        $A.enqueueAction(action);
    },
    showToast: function(component, event, helper, theMessage, severity, messageTitle){
        var toastEvent = $A.get('e.force:showToast');
        toastEvent.setParams({
            'title': messageTitle,
            'message': theMessage,
            'mode': 'pester',
            'duration':2000,
            'type': severity
        });
        toastEvent.fire();
    },

    navigateToMovieTab: function(component, event, helper, objectId){
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": "/" + objectId
        });
        urlEvent.fire();
    }
})
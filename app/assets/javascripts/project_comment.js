$(document).on('turbolinks:load', function() {

    $('#comBase').masonry({
        itemSelector: '.post',
        columnWidth: 0,
        isAnimated: true,
        isFitWidth: true,
        gutterWidth: 0,
        containerStyle: { position: 'relative' },
        Resizable: true
    });

});

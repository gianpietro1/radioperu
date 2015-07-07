window.PA = window.PA || {};

PA.search = {
   init: function(){

      $.widget( "custom.catcomplete", $.ui.autocomplete, {
      _create: function() {
      this._super();
      this.widget().menu( "option", "items", "> :not(.ui-autocomplete-category)" );
      },
      _renderMenu: function( ul, items ) {
      var that = this,
      currentCategory = "";
      $.each( items, function( index, item ) {
      var li;
      if ( item.category != currentCategory ) {
      ul.append( "<li class='ui-autocomplete-category'>" + item.category + "</li>" );
      currentCategory = item.category;
      }
      li = that._renderItemData( ul, item );
      if ( item.category ) {
      li.attr( "aria-label", item.category + " : " + item.label );
      }
      if ( item.model ) {
      li.attr( "model", item.model );
      }
      });
      }
      });

      $(function() {

            $( ".search-field" ).catcomplete({


              select:function(event, ui){
                    if ( ui.item.model == 'Artist' ) {
                        window.location = '/artists/' + ui.item.model_id;
                    }
                    else if ( ui.item.model == 'Album' ) {
                        window.location = '/artists/' + ui.item.parent_model_id + '/albums/' + ui.item.model_id;
                    }
                    else if ( ui.item.model == 'Song' ) {
                        window.location = '/artists/' + ui.item.gparent_model_id + '/albums/' + ui.item.parent_model_id + '/songs/' + ui.item.model_id
                    }
                },
          
              appendTo: ".search-form",
              source: '/search_suggestions' 
              });

        });


   }
}

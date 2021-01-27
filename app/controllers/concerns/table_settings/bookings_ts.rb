        module TableSettings
          module BookingsTs

            extend ActiveSupport::Concern

            private

            def default_table_settings
              {
                id: ActiveSupport::HashWithIndifferentAccess.new( 
                  code: :id, 
                  name: "Sl. No.", 
                  col_visible: true, 
                  col_hideable: false, 
                  col_orderable: true, 
                  col_searchable: false),
                user_name: ActiveSupport::HashWithIndifferentAccess.new( 
                  code: :user_name, 
                  name: "Booking By", 
                  col_visible: true, 
                  col_hideable: false, 
                  col_orderable: true, 
                  col_searchable: false),           
                created_date: ActiveSupport::HashWithIndifferentAccess.new( 
                  code: :created_date, 
                  name: "Created Date", 
                  col_visible: true, 
                  col_hideable: true, 
                  col_orderable: true, 
                  col_searchable: true
                ),
                action: ActiveSupport::HashWithIndifferentAccess.new( 
                  code: :action, 
                  name: "Actions", 
                  col_visible: true, 
                  col_hideable: true, 
                  col_orderable: true, 
                  col_searchable: true
                )
              }
            end

            def configure_booking_table_settings
              @table_settings = default_table_settings
            end
          end
        end

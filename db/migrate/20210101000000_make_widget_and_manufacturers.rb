class MakeWidgetAndManufacturers < ActiveRecord::Migration[6.1]
  def change
    create_table :widget_statuses,
      comment: "List of definitive widget statuses" do |t|

      t.text :name, null: false,
        comment: "The name of the status"
      t.timestamps null: false
    end

    add_index :widget_statuses, :name, unique: true,
      comment: "No two widget statuses should have the same name"
    create_table :addresses,
      comment: "Addresses for manufacturers" do |t|

      t.text :street, null: false,
         comment: "Street part of the address"
      t.text :zip, null: false,
        comment: "Postal or zip code of this address"

      t.timestamps null: false
    end

    create_table :manufacturers,
      comment: "Makers of the widgets we sell" do |t|

     t.text :name, null: false,
       comment: "Name of this manufacturer"

     t.references :address, null: false,
        foreign_key: true,
        comment: "The address of this manufacturer"

     t.timestamps null: false
    end

    add_index :manufacturers, :name, unique: true

    create_table :widgets,
      comment: "The stuff we sell" do |t|

     t.text :name, null: false,
       comment: "Name of this widget"

     t.integer :price_cents, null: false,
       comment: "Price of this widget in cents"

     t.references :widget_status, null: false,
        foreign_key: true,
        comment: "The current status of this widget"

     t.references :manufacturer, null: false,
        foreign_key: true,
        comment: "The maker of this widget"

     t.timestamps null: false
    end

      add_index :widgets, [ :name, :manufacturer_id ],
        unique: true,
        comment: "No manufacturer can have two widgets with " + 
                 "the same name"

# START:edit:3
    reversible do |dir|
      dir.up do
        execute %{
          ALTER TABLE
            widgets
          ADD CONSTRAINT
            price_must_be_positive
          CHECK (
            price_cents > 0
          )
        }
      end
    end

# END:edit:3
  end
end

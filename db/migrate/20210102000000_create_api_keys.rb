class CreateApiKeys < ActiveRecord::Migration[6.1]
  def change
    create_table :api_keys,
      comment: "Holds all API keys for access to the API" do |t|

      t.text :key, null: false,
        comment: "The actual key clients should use"

      t.text :client_name, null: false,
        comment: "Name of the client who was assigned this key"

      t.datetime :created_at, null: false,
        comment: "When this key was created"

      t.datetime :deactivated_at, null: true,
        comment: "When the key was deactivated. " + 
                 "When present, this key is not valid."


      # Note: No updated_at because there should be no updates
      #       to rows here other than to deactivate
    end
# START:edit:3
  add_index :api_keys, :key, unique: true,
    comment: "API keys have to be unique or we " + 
             "don't know who is accessing us"

  reversible do |dir|
    dir.up do
      execute %{
        CREATE UNIQUE INDEX
          api_clients_have_only_one_active_key
        ON
          api_keys(client_name)
        WHERE
          (deactivated_at IS NULL)
      }
    end
  end
# END:edit:3
  end
end

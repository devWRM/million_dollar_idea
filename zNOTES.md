
rails routes
localhost:3000/rails/info/routes

=======================================================
Had to adjust tables
    Took 2 financial columns out of Supports table
    Transferred them to Ideas table
        t.integer :budgeted_dollars
        t.integer :spent_dollars

    Took 2 financial columns out of Supports table
    Reserve to auto-generate on a show page
        t.integer :budgeted_dollars_remaining
        t.boolean :within_budget

    Add a cost column to the Supports table

=======================================================









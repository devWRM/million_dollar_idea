module ResourcesHelper

    def resource_index_heading
        if @idea 
            "All Resources for #{@idea.title}"
        else
            "All Resources"
        end
    end

end

module PostsHelper

    require 'pry'

    def replace(text)
        # return(text.sub(/U/, ""))
        # puts text
        # return(text.is_a?(Object))
        # return(text.strip())
    end


    def associateColumnNameWithNormalName(column)

        nameTable = [[1, "id",         "番号"],
                     [2, "created_at", "投稿日"], 
                     [3, "updated_at", "更新日"],
                     [4, "budget",     "費用"],
                     [5, "place",      "場所"],
                     [6, "time",       "時間"],
                     [7, "season",     "季節"],
                     [8, "whasaid",    "プロポーズの言葉"],
                     [9, "comment",    "その他・備考"],
                     [10, "present",   "プレゼント"]
                    ]
        
        return nameTable[column][2]
    end

    def replaceNewLineCode(str)

        # return str.gsub('<br>', '\n')
        return h(str).gsub(/\R/, "<br>")
    end
end

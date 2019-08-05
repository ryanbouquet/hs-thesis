view: complexity {
  derived_table: {
    sql: SELECT cards_card_id as id, SUM(CASE WHEN cards__mechanics_name = "Discover" THEN 3
                          WHEN cards__mechanics_name = "Adapt" THEN 2
                          WHEN cards__mechanics_name = "AdjacentBuff" THEN 2
                          WHEN cards__mechanics_name = "Aura" THEN 2
                          WHEN cards__mechanics_name = "Battlecry" THEN 2
                          WHEN cards__mechanics_name = "Combo" THEN 2
                          WHEN cards__mechanics_name = "Deathrattle" THEN 2
                          WHEN cards__mechanics_name = "Echo" THEN 2
                          WHEN cards__mechanics_name = "Magnetic" THEN 2
                          WHEN cards__mechanics_name = "Overload" THEN 2
                          WHEN cards__mechanics_name = "Quest" THEN 2
                          WHEN cards__mechanics_name = "Recruit" THEN 2
                          WHEN cards__mechanics_name = "Secret" THEN 2
                          WHEN cards__mechanics_name = "AffectedBySpellPower" THEN 1
                          WHEN cards__mechanics_name = "Charge" THEN 1
                          WHEN cards__mechanics_name = "Divine Shield" THEN 1
                          WHEN cards__mechanics_name = "Freeze" THEN 1
                          WHEN cards__mechanics_name = "ImmuneToSpellpower" THEN 1
                          WHEN cards__mechanics_name = "Inspire" THEN 1
                          WHEN cards__mechanics_name = "Jade Golem" THEN 1
                          WHEN cards__mechanics_name = "Lifesteal" THEN 1
                          WHEN cards__mechanics_name = "OneTurnEffect" THEN 1
                          WHEN cards__mechanics_name = "Overkill" THEN 1
                          WHEN cards__mechanics_name = "Poisonous" THEN 1
                          WHEN cards__mechanics_name = "Rush" THEN 1
                          WHEN cards__mechanics_name = "Silence" THEN 1
                          WHEN cards__mechanics_name = "Spell Damage" THEN 1
                          WHEN cards__mechanics_name = "Stealth" THEN 1
                          WHEN cards__mechanics_name = "Taunt" THEN 1
                          WHEN cards__mechanics_name = "Windfury" THEN 1
                          ELSE 0
                          END) as complexity
            FROM(SELECT
                  cards.cardId  AS cards_card_id,
                  cards__mechanics.name  AS cards__mechanics_name
                  FROM test.cards  AS cards
                  LEFT JOIN UNNEST(cards.mechanics) as cards__mechanics

            WHERE
              ((cards__mechanics.name IS NOT NULL))
            GROUP BY 1,2
            ORDER BY 1 ) as expanded
        GROUP BY 1
        ORDER BY 1 ;;
     #persist_for: "24 hours"
    }

    dimension: id {
      primary_key: yes
      type: number
      sql: ${TABLE}.id ;;
    }

    dimension: complexity {
      type: number
      sql: ${TABLE}.complexity ;;
    }
  }

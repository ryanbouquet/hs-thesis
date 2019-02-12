view: rank_by_plays {
  derived_table: {
    sql: SELECT ROW_NUMBER() OVER() as rank, cards_name, cards_card_set, games_count
        FROM
          (SELECT
            cards.name  AS cards_name,
            cards.cardSet  AS cards_card_set,
            COUNT(DISTINCT games.id ) AS games_count
          FROM test.games  AS games
          LEFT JOIN UNNEST(games.card_history) as games__card_history
          LEFT JOIN UNNEST(games__card_history.card) as games__card_history__card
          FULL OUTER JOIN test.cards  AS cards ON games__card_history__card.id = cards.cardId
          WHERE ((cards.name IS NOT NULL))
          GROUP BY 1,2
          ORDER BY 3 DESC) ;;
    persist_for: "24 hours"
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: name {
    type: number
    primary_key: yes
    sql: ${TABLE}.cards_name ;;
  }
}

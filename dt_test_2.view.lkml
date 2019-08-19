view: dt_test_2 {
  derived_table: {
    sql: select * from ${dt_test.SQL_TABLE_NAME} ;;
    persist_for: "24 hours"
  }

  dimension: health {
    type: number
    sql: ${TABLE}.health ;;
  }

  dimension: card_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.cardId ;;
  }
}

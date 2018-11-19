SELECT
  id item_id,
  name,
  amount item_amount,
  item_calendar.quantity,
  amount * item_calendar.quantity activity_amount
FROM
     activity_items
JOIN (
  SELECT
    activity_item_id,
    SUM(target) quantity
  FROM activity_item_calendars
  GROUP BY activity_item_id
) item_calendar ON item_calendar.activity_item_id = activity_items.id
WHERE
    year = 2019
  AND unit_id = 44
  AND deleted_at IS NULL
SELECT
	"item_id",
	"location_id",
	"type",
	"available",
	"category",
	"subcategory",
	"description",
	"created_at",
	"updated_at",
	SUM( "onhand" ) AS "onhand" 
FROM
	inventoryview 
GROUP BY
	"item_id",
	"location_id",
	"type",
	"available",
	"category",
	"subcategory",
	"description",
	"created_at",
	"updated_at"
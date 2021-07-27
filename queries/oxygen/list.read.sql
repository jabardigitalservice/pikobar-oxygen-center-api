SELECT 
    oxygen_center_name, item_type, district.district_code, district.district_name,
    oxygen_center.subdistrict_code, subdistrict.subdistrict_name, phones, address, status 
FROM 
    oxygen_center 
INNER JOIN 
    subdistrict ON oxygen_center.subdistrict_code = subdistrict.subdistrict_code 
INNER JOIN 
    district ON district.district_code = subdistrict.district_code 
WHERE 
    oxygen_center_name ILIKE '%'
    {{if isSet "search"}}
        AND to_tsvector(oxygen_center_name) || to_tsvector(address) @@ plainto_tsquery('{{.search}}')
    {{end}}

    {{if isSet "district_code"}}
        AND district.district_code = '{{.district_code}}' 
    {{end}}    
    
    {{if isSet "subdistrict_code"}}
        AND subdistrict.subdistrict_code = '{{.subdistrict_code}}'
    {{end}}

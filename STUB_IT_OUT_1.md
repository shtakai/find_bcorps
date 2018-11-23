# STUB IT OUT VS 1

## Description:
The FindBCorpsCLI is a command-line app that consumers and job seekers will use to search for Certified B Corporations. Searches can be simple or advanced.
    - Simple search by company name only
    - Advanced search by:
        - Industry
        - Country
        - State/province
        - City

## Sorting result options includes:
    - By certification date
    - Alphabetical in descending or ascending 
    - Reset clear choices

## Outline of first version
    - Greet user and ask for search input choice (simple or advanced)
    - After submitting search, show a listing of all B corps that meet the search criteria.
    - Each listing links to a page with that company’s full description.
    - Sort search results by certification date or alpha sort  in ascending or descending order.
    - Reset search query

## CLI flow

1. Greeting

    “Which type of search would you like to try?”

    (1) Simple search (by company name only)
    (2) Advanced search (any combination of industry, country, state, or city.)


def search_type_choice
    if input ==  
        simple_search

elseif == 2
        advanced search
    else 
        greeting
    end   

def simple_search
    puts “type company name” 
    return a listing of results based on (input) displaying company name, industries, location
    if no results match search return a simple listing of all companies with the same first letter of company name” &&  try_again    
    end

def advanced search
    return simple listing of all companies matching criteria in alpha ascending sort.
    if no results match  try_again    
end
        
def reset_search
    clear
end

def try_again    
    reset_search
    puts “No results were found that matched your search criteria. Would you like to:
    A. try a simple company search?
                B. try an advanced search without company name”. 
    end            

## Company Attributes (fields)
    product/services =  .field-name-field-products-and-services
    certified since = .field-name-field-date-certified
    *industry type (sector) = .field-name-field-sector
    country: field-name-field-country
    company name = .heading3 or h1.heading3
    company website url = field-name-field-website
    company description = .field-name-body

## Company Listing view:
    company name
    industries
    city, state, country.
    link to a company’s full page view

## Company Full view
    product/services =  .field-name-field-products-and-services
    certified since = .field-name-field-date-certified
    *industry type (sector) = .field-name-field-sector
    country: field-name-field-country
    company name = .heading3 or h1.heading3
    company website url = field-name-field-website
    company description = .field-name-body

### Next versions:
    All of the above capabilities for first version 
    Overall B Impact Score
    Benchmark
    Company logos, if possible.
    Share (FB, Twitter, Linkedin, email)
    Newsletter sign up for latest news about community of Certified B Corporations

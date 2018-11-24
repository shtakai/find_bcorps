# STUB IT OUT VS 1

## Description:

The FindBCorpsCLI is a command-line app that consumers and job seekers will use to search for Certified B Corporations. Searches can be simple or advanced. User will choose

    (1) Simple search by company name only
    (2) Advanced search by:
        - Industry
        - Country
        - State/province
        - City

## Sorting result options includes:

    - By certification date
    - Alphabetical in descending or ascending 
    - Reset clear choices

## Outline of first version

    - Greet user and ask if they want a simple or advanced search. 
    - After submitting their search, show a listing of all B corps that meet the search criteria.
    - Each listing links to a page with that company’s full description.
    - Searches are not final, so give them a way to do more searches
    - Sort search results by certification date or alpha sort in ascending or descending order.
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

 ### Simple_search
    - User types company name and submits.
    - Returns a listing of all companies or company with that name.
    - Short list of details are included with that company.
        -company name
        -industries
        -location 
    - If no results match search return a simple listing of all companies with the same first letter of company name. &&
    "That didn't match exactly, try again, or try a more advanced search with different detail?

        - (1)try another company name
        - (2)advanced search

### Advanced search:

    - return simple listing view of all companies matching criteria in alpha ascending sort.
    - if no results match  try_again

## Company Attributes (fields)

    - product/services =  .field-name-field-products-and-services
    - certified since = .field-name-field-date-certified
    - industry type (sector) = .field-name-field-sector
    - country: field-name-field-country
    - company name = .heading3 or h1.heading3
    - company website url = field-name-field-website
    - company description = .field-name-body

## SIMPLE Listing view:

    - company name
    - industries
    - city, state, country.
    - link to a company’s full page view

## FULL view

    - product/services =  .field-name-field-products-and-services
    - industry type (sector) = .field-name-field-sector
    - country: field-name-field-country
    - company name = .heading3 or h1.heading3
    - company website url = field-name-field-website
    - company description = .field-name-body
    -  * certified since = .field-name-field-date-certified (2ND VERSION)

### Next versions:

    - All of the above capabilities for first version 
    - Overall B Impact Score
    - Benchmark
    - Company logos, if possible.
    - Share (FB, Twitter, Linkedin, email)
    - Newsletter sign up for latest news about community of Certified B Corporations

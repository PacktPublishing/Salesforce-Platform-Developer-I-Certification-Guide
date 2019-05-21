public class MovieResponse {
        @AuraEnabled
        public Integer vote_count {get; set;}
        @AuraEnabled
        public Integer id {get; set;}
        @AuraEnabled
        public Boolean video {get; set;}
        @AuraEnabled
        public Decimal vote_average {get; set;}
        @AuraEnabled
        public String title {get; set;}
        @AuraEnabled
        public Decimal popularity {get; set;}
        @AuraEnabled
        public String poster_path {get; set;}
        @AuraEnabled
        public String original_language {get; set;}
        @AuraEnabled
        public String original_title {get; set;}
        @AuraEnabled
        public List<Integer> genre_ids {get; set;}
        @AuraEnabled
        public List<String> genres {get; set;}
        @AuraEnabled
        public String backdrop_path {get; set;}
        @AuraEnabled
        public Boolean adult {get; set;}
        @AuraEnabled
        public String overview {get; set;}
        @AuraEnabled
        public String release_date {get; set;}
}
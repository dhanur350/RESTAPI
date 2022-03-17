namespace WebApp.Models //Using this WebApp and Combine with Models so we can store data like DataBase
{
    public class Command //This Funcition is used to create Query which will create 
    {                    //a link to our Database to send request these Columns fields
        public int Id{get; set;}
        public string HowTo{get;set;}
        public string plateform{get;set;}
        public string Commandline{get;set;}
    }
}
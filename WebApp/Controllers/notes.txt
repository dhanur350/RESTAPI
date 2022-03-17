using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using WebApp.Models;
using Microsoft.EntityFrameworkCore;

namespace WebApp.Controllers
{
    [Route("WebApp/[controller]")] 
    [ApiController] //This is telling that it's controller class
    public class CommandsControllers:ControllerBase //Here We'll write commandscontrollers in localhost:5000 to get this request in like string
    {
        private readonly CommandContext _context; //Private Function objectname Starts with UnderScore

        public CommandsControllers(CommandContext context) => _context=context; 

        [HttpGet]  //Fetch Data From Database 
        public ActionResult<IEnumerable<Command>> GetCommands()
        {
            return _context.CommandItems;
        }
        [HttpGet("{Id}")]  //Fetch Data from Database with specific ID in Get Request
        public ActionResult<Command> GetCommandItem(int Id)
        {
            var commandItem = _context.CommandItems.Find(Id);
            if(commandItem==null)
            {
                return NotFound();
            }
            return commandItem;
        }
        [HttpPost]  //Send a query to add in Database or Insert Query in Database
        public ActionResult<Command> PostCommandItem(Command command)
        {
            _context.CommandItems.Add(command);
            _context.SaveChanges();
            return CreatedAtAction("GetCommandItem",new Command{Id=command.Id},command);
        }

        [HttpPut("{id}")]
        public ActionResult PutCommandItem(int id,Command command)
        {
            if(id!=command.Id)
            {
                return BadRequest();
            }
            _context.Entry(command).State=EntityState.Modified;
            _context.SaveChanges();
            return CreatedAtAction("GetCommandItem",new Command{Id=command.Id},command);
        }
        /*
        Creates a Microsoft.AspNetCore.Mvc.CreatedAtActionResult  
        object that produces a Microsoft.AspNetCore.Http.StatusCodes.Status201Created  response.
        */
        /*{
            _context=context; //Dependency Injection to inject DBContext Class to here
        
        //[HttpGet] It'll respond to get requests from HTML 
        public ActionResult<IEnumerable<string>> GetString()
        {
            return new string[] {"This","is","Hard","Coded"};
        }
        }*/
        [HttpDelete("{id}")] //Delete Query from Database via DELETE HTTP Method
        public ActionResult<Command> DeleteCommandItem(int id)
        {
            var commandItem = _context.CommandItems.Find(id);
            if(commandItem==null)
            {
                return NotFound();
            }
            _context.CommandItems.Remove(commandItem);
            _context.SaveChanges();
            
            return commandItem;
        }
    }
}
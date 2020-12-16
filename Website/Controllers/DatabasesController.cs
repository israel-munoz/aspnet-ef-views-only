using Data;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.Http;
using Website.Models;

namespace Website.Controllers
{
    /// <summary>
    /// api/databases controller
    /// </summary>
    public class DatabasesController : ApiController
    {
        /// <summary>
        /// Get the name of databases from config.
        /// </summary>
        [HttpGet()]
        [Route("api/databases")]
        public IHttpActionResult GetDatabases()
        {
            var dbs = GetDatabasesFromConfig();
            return Ok(dbs.Select(db => db.Name));
        }

        /// <summary>
        /// Get the users from a specified database.
        /// </summary>
        /// <param name="database">Database to retrieve users from.</param>
        [HttpGet()]
        [Route("api/databases/{database}/users")]
        public IHttpActionResult GetUsers(string database)
        {
            var dbs = GetDatabasesFromConfig();
            var db = dbs.FirstOrDefault(d => d.Name == database);
            if (db == null)
            {
                return BadRequest("Invalid database");
            }

            DataContext dbContext;
            try
            {
                dbContext = new DataContext(db.ConnectionString);
            }
            catch (Exception ex)
            {
                return BadRequest($"Error initializing database. {ex.Message}.");
            }
            try
            {
                var users = dbContext.Users.ToArray();
                return Ok(users);
            }
            catch (Exception ex)
            {
                return BadRequest($"Error retrieving users. {ex.Message}.");
            }
        }

        /// <summary>
        /// Get database configuration items.
        /// </summary>
        /// <returns>Returns a list of Database objects.</returns>
        private IEnumerable<DatabaseModel> GetDatabasesFromConfig()
        {
            var data = File.ReadAllText(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data", "databases.json"));
            var dbs = JsonConvert.DeserializeObject<IEnumerable<DatabaseModel>>(data);
            return dbs;
        }
    }
}

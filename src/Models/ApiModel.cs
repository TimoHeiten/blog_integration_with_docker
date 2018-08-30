using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.ModelBinding;

namespace integration_with_docker.src.Models
{
    public class ApiModel
    {
        public int Id { get; set; }
        [BindRequired]
        public string ModelName { get; set; }
        [BindRequired]
        public bool IsModelActive { get; set; }
    }
}
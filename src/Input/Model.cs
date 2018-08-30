using System;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.ModelBinding;

namespace integration_with_docker.Input
{
    public class Model
    {
        public string Name { get; set; }
        [Required]
        [BindRequired]
        public string Identifier { get; set; }

        [Required]
        [BindRequired]
        public bool IsActive { get; set; }
    }
}
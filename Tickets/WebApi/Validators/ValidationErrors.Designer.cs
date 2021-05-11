﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApi.Validators {
    using System;
    
    
    /// <summary>
    ///   A strongly-typed resource class, for looking up localized strings, etc.
    /// </summary>
    // This class was auto-generated by the StronglyTypedResourceBuilder
    // class via a tool like ResGen or Visual Studio.
    // To add or remove a member, edit your .ResX file then rerun ResGen
    // with the /str option, or rebuild your VS project.
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("System.Resources.Tools.StronglyTypedResourceBuilder", "16.0.0.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    public class ValidationErrors {
        
        private static global::System.Resources.ResourceManager resourceMan;
        
        private static global::System.Globalization.CultureInfo resourceCulture;
        
        [global::System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        internal ValidationErrors() {
        }
        
        /// <summary>
        ///   Returns the cached ResourceManager instance used by this class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        public static global::System.Resources.ResourceManager ResourceManager {
            get {
                if (object.ReferenceEquals(resourceMan, null)) {
                    global::System.Resources.ResourceManager temp = new global::System.Resources.ResourceManager("WebApi.Validators.ValidationErrors", typeof(ValidationErrors).Assembly);
                    resourceMan = temp;
                }
                return resourceMan;
            }
        }
        
        /// <summary>
        ///   Overrides the current thread's CurrentUICulture property for all
        ///   resource lookups using this strongly typed resource class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        public static global::System.Globalization.CultureInfo Culture {
            get {
                return resourceCulture;
            }
            set {
                resourceCulture = value;
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Category should not be empty!.
        /// </summary>
        public static string EmptyCategory {
            get {
                return ResourceManager.GetString("EmptyCategory", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to ConsultantId should not be empty!.
        /// </summary>
        public static string EmptyConsultantId {
            get {
                return ResourceManager.GetString("EmptyConsultantId", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Description should not be empty!.
        /// </summary>
        public static string EmptyDescription {
            get {
                return ResourceManager.GetString("EmptyDescription", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Id should not be empty!.
        /// </summary>
        public static string EmptyId {
            get {
                return ResourceManager.GetString("EmptyId", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Priority should not be empty!.
        /// </summary>
        public static string EmptyPriority {
            get {
                return ResourceManager.GetString("EmptyPriority", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Status should not be empty!.
        /// </summary>
        public static string EmptyStatus {
            get {
                return ResourceManager.GetString("EmptyStatus", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Title should not be empty!.
        /// </summary>
        public static string EmptyTitle {
            get {
                return ResourceManager.GetString("EmptyTitle", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to UserId should not be empty!.
        /// </summary>
        public static string EmptyUserId {
            get {
                return ResourceManager.GetString("EmptyUserId", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Category should be Software, Hardware, Hr..
        /// </summary>
        public static string InvalidCategory {
            get {
                return ResourceManager.GetString("InvalidCategory", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Id Length should have 24 characters!.
        /// </summary>
        public static string InvalidIdLength {
            get {
                return ResourceManager.GetString("InvalidIdLength", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Id doesn&apos;t respect the ObjectId structure..
        /// </summary>
        public static string InvalidIdStructure {
            get {
                return ResourceManager.GetString("InvalidIdStructure", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Priority should be High, Medium, Low..
        /// </summary>
        public static string InvalidPriority {
            get {
                return ResourceManager.GetString("InvalidPriority", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Status should be Open, Solved or Canceled..
        /// </summary>
        public static string InvalidStatus {
            get {
                return ResourceManager.GetString("InvalidStatus", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Description should have minimum 1 character!.
        /// </summary>
        public static string ShortDescription {
            get {
                return ResourceManager.GetString("ShortDescription", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Title should have minimum 1 character!.
        /// </summary>
        public static string ShortTitle {
            get {
                return ResourceManager.GetString("ShortTitle", resourceCulture);
            }
        }
    }
}
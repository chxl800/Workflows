using System;
using System.Collections.Generic;
using System.Text;

namespace WebApplication7.Model
{
    [Serializable]
    public class DataFieldAttribute : Attribute
    {
        private string _FieldName;
        private string _PK;
        public DataFieldAttribute(string fieldname)
        {
            this._FieldName = fieldname;
        }

        public DataFieldAttribute(string fieldname, string pk)
        {
            this._FieldName = fieldname;
            this._PK = pk;
        }

        public string PK
        {
            get { return _PK; }
            set { _PK = value; }
        }

        public string FieldName
        {
            get { return this._FieldName; }
            set { this._FieldName = value; }
        }
    }

}
